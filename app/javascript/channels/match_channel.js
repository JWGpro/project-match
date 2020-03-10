import consumer from "./consumer";
const clearMessagesContainer = document.getElementById('message_content')
console.log('messagess container', clearMessagesContainer);
if (clearMessagesContainer !== null) {
  clearMessagesContainer.addEventListener('keyup', (event) => {
  const key = event.key;

    if (key === "Enter") {
        clearMessagesContainer.value = "";
        clearMessagesContainer.blur()
        clearMessagesContainer.focus()
      }
});
}

const messagesContainer = document.querySelector('.messagess');
if (messagesContainer) {
  const id = messagesContainer.dataset.matchId;
  const userId = messagesContainer.dataset.userId;
  consumer.subscriptions.create({ channel: "MatchChannel", id: id }, {
    received(data) {
      messagesContainer.insertAdjacentHTML('afterbegin', data);
      if (userId === messagesContainer.firstElementChild.dataset.userId) {
        messagesContainer.firstElementChild.classList.remove("message-in")
        messagesContainer.firstElementChild.classList.add("message-out")
      }
      console.log(data); // called when data is broadcast in the cable
    },
  });
}
