import consumer from "./consumer";

const messagesContainer = document.querySelector('.messagess');
if (messagesContainer) {
  const id = messagesContainer.dataset.matchId;
  consumer.subscriptions.create({ channel: "MatchChannel", id: id }, {
    received(data) {
      // send a request to messages#read with specific message from data.
      // messageId = data.id
      // fetch(`http://localhost:3000/messages/${messageId}/read`, { method: "POST" } )
      messagesContainer.insertAdjacentHTML('beforeend', data);
      console.log(data); // called when data is broadcast in the cable
    },
  });
}
