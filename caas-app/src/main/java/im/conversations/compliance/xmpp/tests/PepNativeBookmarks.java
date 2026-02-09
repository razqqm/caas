package im.conversations.compliance.xmpp.tests;

import im.conversations.compliance.annotations.ComplianceTest;
import java.util.Arrays;
import java.util.List;
import rocks.xmpp.core.session.XmppClient;

@ComplianceTest(
        short_name = "xep0402",
        full_name = "XEP-0402: PEP Native Bookmarks",
        url = "https://xmpp.org/extensions/xep-0402.html",
        description =
                "This specification defines a syntax and storage profile for keeping a list of"
                        + " chatroom bookmarks on the server.")
public class PepNativeBookmarks extends AbstractDiscoTest {

    public PepNativeBookmarks(XmppClient client) {
        super(client);
    }

    @Override
    List<String> getNamespaces() {
        return Arrays.asList(
                "urn:xmpp:bookmarks:1#compat",
                "urn:xmpp:bookmarks:1#compat-pep",
                "http://jabber.org/protocol/pubsub#publish-options",
                "http://jabber.org/protocol/pubsub#config-node-max");
    }

    @Override
    boolean checkOnServer() {
        return false;
    }
}
