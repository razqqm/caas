package im.conversations.compliance.xmpp.tests;

import im.conversations.compliance.annotations.ComplianceTest;
import java.util.Arrays;
import java.util.List;
import rocks.xmpp.core.session.XmppClient;

@ComplianceTest(
        short_name = "xep0490",
        full_name = "XEP-0490: Message Displayed Synchronization",
        url = "https://xmpp.org/extensions/xep-0490.html",
        description =
                "This specification allows multiple clients of the same user to synchronize the"
                        + " displayed state of their chats.")
public class MessageDisplayedSynchronization extends AbstractDiscoTest {

    public MessageDisplayedSynchronization(XmppClient client) {
        super(client);
    }

    @Override
    List<String> getNamespaces() {
        return Arrays.asList(
                "http://jabber.org/protocol/pubsub#publish-options",
                "http://jabber.org/protocol/pubsub#config-node-max");
    }

    @Override
    boolean checkOnServer() {
        return false;
    }
}
