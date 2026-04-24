package im.conversations.compliance.i18n;

import java.util.HashMap;
import java.util.Map;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

public class I18nFreemarkerEngine extends FreeMarkerEngine {

    @Override
    public String render(ModelAndView modelAndView) {
        Object model = modelAndView.getModel();
        Map<String, Object> newModel;
        if (model instanceof Map) {
            @SuppressWarnings("unchecked")
            Map<String, Object> original = (Map<String, Object>) model;
            newModel = new HashMap<>(original);
        } else {
            newModel = new HashMap<>();
        }
        newModel.putIfAbsent("i18n", I18n.INSTANCE);
        newModel.putIfAbsent("lang", I18n.currentLanguage());
        return super.render(new ModelAndView(newModel, modelAndView.getViewName()));
    }
}
