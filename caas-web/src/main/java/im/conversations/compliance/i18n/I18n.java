package im.conversations.compliance.i18n;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;
import java.util.List;
import java.util.Locale;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;
import spark.Request;
import spark.Response;

public final class I18n implements TemplateMethodModelEx {

    public static final I18n INSTANCE = new I18n();
    private static final String BUNDLE_BASE = "i18n.messages";
    private static final Locale DEFAULT_LOCALE = Locale.ENGLISH;
    private static final ThreadLocal<Locale> CURRENT_LOCALE =
            ThreadLocal.withInitial(() -> DEFAULT_LOCALE);

    private static final ResourceBundle.Control UTF8_CONTROL =
            new ResourceBundle.Control() {
                @Override
                public ResourceBundle newBundle(
                        String baseName,
                        Locale locale,
                        String format,
                        ClassLoader loader,
                        boolean reload)
                        throws IOException {
                    String bundleName = toBundleName(baseName, locale);
                    String resourceName = toResourceName(bundleName, "properties");
                    try (InputStream stream = loader.getResourceAsStream(resourceName)) {
                        if (stream == null) {
                            return null;
                        }
                        return new PropertyResourceBundle(
                                new InputStreamReader(stream, StandardCharsets.UTF_8));
                    }
                }
            };

    private I18n() {}

    public static void setCurrent(Locale locale) {
        CURRENT_LOCALE.set(locale == null ? DEFAULT_LOCALE : locale);
    }

    public static void clear() {
        CURRENT_LOCALE.remove();
    }

    public static String currentLanguage() {
        return CURRENT_LOCALE.get().getLanguage();
    }

    public static String t(String key) {
        try {
            ResourceBundle bundle =
                    ResourceBundle.getBundle(BUNDLE_BASE, CURRENT_LOCALE.get(), UTF8_CONTROL);
            if (bundle.containsKey(key)) {
                return bundle.getString(key);
            }
        } catch (Exception ignored) {
            // fall through
        }
        return key;
    }

    private static boolean isSupported(String tag) {
        return "en".equals(tag) || "ru".equals(tag);
    }

    public static Locale resolveFrom(Request request, Response response) {
        if (request == null) {
            return DEFAULT_LOCALE;
        }
        String queryLang = request.queryParams("lang");
        if (queryLang != null && isSupported(queryLang)) {
            if (response != null) {
                response.cookie("/", "lang", queryLang, 60 * 60 * 24 * 365, false, false);
            }
            return new Locale(queryLang);
        }
        String cookieLang = request.cookie("lang");
        if (cookieLang != null && isSupported(cookieLang)) {
            return new Locale(cookieLang);
        }
        String header = request.headers("Accept-Language");
        if (header == null || header.isEmpty()) {
            return DEFAULT_LOCALE;
        }
        for (String part : header.split(",")) {
            String tag = part.split(";")[0].trim().toLowerCase(Locale.ROOT);
            if (tag.startsWith("ru")) {
                return new Locale("ru");
            }
            if (tag.startsWith("en")) {
                return Locale.ENGLISH;
            }
        }
        return DEFAULT_LOCALE;
    }

    @Override
    public Object exec(@SuppressWarnings("rawtypes") List arguments) throws TemplateModelException {
        if (arguments.isEmpty()) {
            return "";
        }
        String key = arguments.get(0).toString();
        ResourceBundle bundle =
                ResourceBundle.getBundle(BUNDLE_BASE, CURRENT_LOCALE.get(), UTF8_CONTROL);
        if (!bundle.containsKey(key)) {
            return key;
        }
        String template = bundle.getString(key);
        if (arguments.size() == 1) {
            return template;
        }
        Object[] params = new Object[arguments.size() - 1];
        for (int i = 0; i < params.length; i++) {
            params[i] = arguments.get(i + 1).toString();
        }
        return MessageFormat.format(template, params);
    }
}
