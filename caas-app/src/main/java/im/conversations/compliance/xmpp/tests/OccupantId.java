package im.conversations.compliance.xmpp.tests;

import static im.conversations.compliance.utils.ConversationsUtils.generateConversationsLikePronounceableName;

import im.conversations.compliance.annotations.ComplianceTest;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import rocks.xmpp.core.XmppException;
import rocks.xmpp.core.session.XmppClient;
import rocks.xmpp.extensions.disco.ServiceDiscoveryManager;
import rocks.xmpp.extensions.muc.ChatRoom;
import rocks.xmpp.extensions.muc.ChatService;
import rocks.xmpp.extensions.muc.MultiUserChatManager;

@ComplianceTest(
        short_name = "xep0421",
        full_name = "XEP-0421: Anonymous unique occupant identifiers for MUCs",
        url = "https://xmpp.org/extensions/xep-0421.html",
        description =
                "This specification defines a method that allows clients to identify a MUC"
                        + " participant across reconnects and renames. It thus prevents"
                        + " impersonification of anonymous users.")
public class OccupantId extends AbstractTest {

    private static final Logger LOGGER = LoggerFactory.getLogger(OccupantId.class);

    public OccupantId(XmppClient client) {
        super(client);
    }

    @Override
    public boolean run() {
        final ServiceDiscoveryManager serviceDiscoveryManager =
                client.getManager(ServiceDiscoveryManager.class);
        final MultiUserChatManager multiUserChatManager =
                client.getManager(MultiUserChatManager.class);
        try {
            final var chatServices = multiUserChatManager.discoverChatServices().getResult();
            if (chatServices.isEmpty()) {
                LOGGER.debug("Unable to find a MUC service");
                return false;
            }
            final ChatService chatService = chatServices.get(0);
            final ChatRoom room =
                    chatService.createRoom(generateConversationsLikePronounceableName());
            room.enter("test").getResult();
            final Set<String> features =
                    serviceDiscoveryManager
                            .discoverInformation(room.getAddress())
                            .getResult()
                            .getFeatures();
            final boolean hasFeature = features.contains("urn:xmpp:occupant-id:0");
            room.destroy().getResult();
            return hasFeature;
        } catch (final XmppException e) {
            LOGGER.debug("Unable to create a test room (" + e.getMessage() + ")");
            return false;
        }
    }
}
