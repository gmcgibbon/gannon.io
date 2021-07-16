// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

Rails.start()
Turbolinks.start()

import "stylesheets/application"

const getMode = () => {
  if ("mode" in localStorage) {
    return localStorage.mode;
  } else {
    let mode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light";
    setMode(mode);

    return mode;
  }
}

const setMode = (mode) => {
  localStorage.mode = mode;
}

document.addEventListener("turbolinks:load", () => {
  document.documentElement.classList.add(getMode()); 

  document.querySelector("#dark-toggle").addEventListener("click", (event) => {
    event.preventDefault();
    const mode = getMode();
    const oppositeMode = mode == "dark" ? "light" : "dark";
    document.documentElement.classList.remove(mode);
    document.documentElement.classList.add(oppositeMode);
    setMode(oppositeMode);
  });
});