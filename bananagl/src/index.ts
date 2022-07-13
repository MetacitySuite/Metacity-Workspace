



//draft API 
//  open layer
//     init loader
//     - specify layer names and general settings
//     - load layer
//     - location, style in URL
//     - load as much to fill thre screen

import { BananaGL } from "./bananagl";

//  styles
//  - switch between styles specified inside 


window.onload = () => {
    const canvas = document.getElementById("canvas") as HTMLCanvasElement;
    const gl = new BananaGL({ canvas, workerPath: "dist/worker.js" });
    gl.layer({
        path: "/data/buildings",
    });
    gl.layer({
        path: "/data/terrain",
    });
}

