import consumer from "./consumer";

document.addEventListener('turbolinks:load', () => {
  const username = document.querySelector('#username');
  if (username) {
    const id = username.dataset.id;
    consumer.subscriptions.create({ channel: 'NotificationsChannel', user_id: id }, {
      received(data) {
        document.body.insertAdjacentHTML('afterend', data);
        // console.log(data);
      }
    });
  }
});
