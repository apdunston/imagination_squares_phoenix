import {init, toggle, global} from "./mappusEngine.js";

init(document);
window.mappusGlobal = global;

function getGlobal() {return global}