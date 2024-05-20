package im.conversations.compliance.xmpp.tests;

import im.conversations.compliance.annotations.ComplianceTest;
import rocks.xmpp.core.session.XmppClient;

@ComplianceTest(
        short_name = "xep0485",
        full_name = "XEP-0485: PubSub Server Information",
        url = "https://xmpp.org/extensions/xep-0485.html",
        description =
                "Facilitates discovery of information of individual domains in an XMPP-based"
                        + " network.",
        informational = true)
public class PubSubServerInformation extends AbstractServiceTest {
    public PubSubServerInformation(XmppClient client) {
        super(client);
    }

    @Override
    public String getNamespace() {
        return "urn:xmpp:serverinfo:0";
    }
}
