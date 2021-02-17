import Typed from 'typed.js';
const initTyped = () => {
  if (document.querySelector(".typed-title")) {
    var options = {
      strings: ['What if you could <em>play</em> at home? '],
      typeSpeed: 40,
      loop: true,
      loopCount: Infinity
    };

    var typed = new Typed(".typed-title", options);
  };
};

export { initTyped };