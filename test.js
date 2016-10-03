var glob = require('glob')

function test (f) {
  console.log(f)
  try {
    require(f)
  }
  catch(e){
    console.log(e)
  }
}

console.log('run all tests')

// do not check node_modules
// check test in lib/* or lib/**/*
glob("./!(node_modules)/**/*+([Tt]est).js", function(er, files) {
  for (let i = 0; i < files.length; i++) test(files[i])
})
