const element = document.querySelector('form');
var submitListener = event => {
  event.preventDefault();
  var content = JSON.stringify(window.mappusGlobal.drawing.export());
  document.getElementById("drawing_content").value = content;
  // actual logic, e.g. validate the form
  console.log('Form submission cancelled.');
  let element = document.querySelector('form');
  element.removeEventListener('submit', submitListener);
  element.submit();
};

element.addEventListener('submit', submitListener);
