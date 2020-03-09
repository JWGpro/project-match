import consumer from "./consumer";

const messagesContainer = document.querySelector('.messagess');
if (messagesContainer) {
  const id = messagesContainer.dataset.matchId;
  const userId = messagesContainer.dataset.userId;
  consumer.subscriptions.create({ channel: "MatchChannel", id: id }, {
    received(data) {
      messagesContainer.insertAdjacentHTML('afterbegin', data);
      if (userId === messagesContainer.lastElementChild.dataset.userId) {
        messagesContainer.lastElementChild.classList.remove("message-in")
        messagesContainer.lastElementChild.classList.add("message-out")
      }
      console.log(data); // called when data is broadcast in the cable
    },
  });
}
