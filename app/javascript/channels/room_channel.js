import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {

  window.messages = document.getElementById('messages')

  if (messages === null) {
      return
  }

  consumer.subscriptions.create("RoomChannel", {
      connected() {
      },

      disconnected() {
      },

      received(data) {
          messages.insertAdjacentHTML('beforeend', data['message'])
      }
  })
})
