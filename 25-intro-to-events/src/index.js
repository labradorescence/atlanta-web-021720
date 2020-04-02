document.addEventListener('DOMContentLoaded',function (event){
  loadListeners()
})

function loadListeners(){
  setupTheForm()
  setupTheButtons()
}

function setupTheButtons(){
  const allKnowingParent = document.querySelector('#button-parent')

  allKnowingParent.addEventListener('click',function(e){
    if(e.target.id === 'alert'){
      alert('this is 💵')
    }else if(e.target.id === 'log'){
      console.log('this is dope!!!')
    }else if(e.target.id === 'errr'){
      console.error('This is an error 🛑')
    }
  })
}

function setupTheForm(){
  // show a comment when user submits the form
    // Get the form
    const commentForm = document.querySelector('#comment-form')
    // Listen for submit
    commentForm.addEventListener('submit',function(e){
      e.preventDefault()

      const inputField = e.target.querySelector('#new-comment')
      // Make comment appear
      const comment = document.createElement('li')
      comment.className ='comment-class'
      comment.innerText = inputField.value
      // 🤚🏻
      const container = document.querySelector('#comments-container')
      container.appendChild(comment)

      e.target.reset()
    })
}

// function makeTheBtnWork(){
//   // Show an alert when I click on alert me button
//
//
//
//
//     // Get the button
//     // const alertBtn = document.querySelector('#alert')
//     // // Listen for the click
//     // alertBtn.addEventListener('click',function(event){
//     //   // Show an alert
//     //   alert('this is 💵')
//     // })
//     //
//     // const logBtn = document.querySelector('#log')
//     // // Listen for the click
//     // logBtn.addEventListener('click',function(){
//     //   // Show a console. log
//     //   console.log('this is dope!!!')
//     // })
//     //
//     // const errBtn = document.querySelector('#errr')
//     // // Listen for the click
//     // errBtn.addEventListener('click',function(){
//     //   // Show an error
//     //   console.error('This is an error 🛑')
//     // })
// }
