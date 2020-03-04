import consumer from "./consumer";

const messagesContainer = document.querySelector('.messagess');
if (messagesContainer) {
  const id = messagesContainer.dataset.matchId;
  consumer.subscriptions.create({ channel: "MatchChannel", id: id }, {
    received(data) {
      messagesContainer.insertAdjacentHTML('beforeend', data);
      console.log(data); // called when data is broadcast in the cable
    },
  });
}
