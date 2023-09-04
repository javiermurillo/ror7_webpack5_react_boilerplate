import React from 'react'
import ReactDOM from 'react-dom'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
      <h1>Hello React!</h1>,
      document.body.appendChild(document.createElement('div')),
  )
})
