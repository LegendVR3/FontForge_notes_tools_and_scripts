"use strict";
/*╔══════════════════════════════════╗
  ║ replaces TABs with 2xSPACE.      ║
  ║ removes SPACE/TAB from line-end. ║
  ╟──────────────────────────────────╢
  ║ keeps empty-lines.               ║
  ║ keeps same EOL.                  ║
  ╚══════════════════════════════════╝
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ */

const FS         = require("fs")
     ,PATH       = require("path")
     ,resolve    = function(path){
                     path = path.replace(/\\+/g,"/"); 
                     path = PATH.resolve(path); 
                     path = path.replace(/\\+/g,"/"); 
                     path = path.replace(/\/\/+/g,"/"); 
                     return path;
                   }
     ,ARGS       = process.argv.filter(function(s){return false === /node\.exe/i.test(s) && false === /index\.js/i.test(s);})
     ,FILE       = resolve(ARGS[0])
     ,FILE_PARTS = PATH.parse(FILE)
     ,FILE_OUT   = resolve(FILE_PARTS.dir + "/" + FILE_PARTS.name + "__nowhitespacesuffix" + FILE_PARTS.ext)
     ,CONTENT    = FS.readFileSync(FILE,{encoding: "utf8"}).replace(/\t/g,"  ").replace(/[\ \t]+$/gm,"")
     ;


FS.writeFileSync(FILE_OUT, CONTENT, {flag:"w", encoding:"utf8"}); //overwrite

process.exitCode = 0;
process.exit();
