function submit() {
  var coloredDiv = document.getElementById("coloredDiv");
  coloredDiv.setAttribute('style', 'background:red;');

  JavascriptChannel.postMessage("+82 010-9926-7403");
}