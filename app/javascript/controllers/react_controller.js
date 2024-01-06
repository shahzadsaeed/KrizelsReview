import { Controller } from "@hotwired/stimulus";
import React from "react";
import ReactDOM from "react-dom/client";
import App from './App'

// Connects to data-controller="react"
export default class extends Controller {
  connect() {
    const root = ReactDOM.createRoot(document.getElementById("app"))
     root.render(
      <App/> 
     )
  }
}
