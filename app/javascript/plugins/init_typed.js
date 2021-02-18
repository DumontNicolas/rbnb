import Typed from 'typed.js';
const initTyped = () => {
  if (document.querySelector(".typed-title")) {
    var options = {
      strings: ['What if you could play at home? ', 'Join us'],
      typeSpeed: 40,
      loop: true,
      loopCount: Infinity,
      showCursor: false
    };

    var typed = new Typed(".typed-title", options);
  };
};

export { initTyped };