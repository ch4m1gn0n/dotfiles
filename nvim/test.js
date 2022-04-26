function playground_text(playground) {
  let code_block = playground.querySelector('code')

  if (window.ace && code_block.classList.contains('editable')) {
    let editor = window.ace.edit(code_block)
    return editor.getValue()
  } else {
    return code_block.textContent
  }
}
