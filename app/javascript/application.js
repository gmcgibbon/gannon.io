// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import HighlightJS from "highlight.js"

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

document.addEventListener("turbo:load", () => {
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

document.addEventListener("turbo:load", () => {
  HighlightJS.highlightAll();
});
