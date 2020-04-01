console.log('%c Hello, World!', 'color: red')


const parentPtag = document.querySelector('#sometext')
// const imgUrl = 'https://i.redd.it/2anfvzha21n11.png'

dankMemes.forEach(function(url){
  // Create the element
  const imgTag = document.createElement('img')
  // Change the src
  imgTag.src = url
  // 🤚🏻 slap it on the dom
  parentPtag.appendChild(imgTag)
})
