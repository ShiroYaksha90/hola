const addToggleListener = (selectedId, menuId, toggleClass) => {
    let selectedElement = document.querySelector(`#${selectedId}`)
    selectedElement.addEventListener('click', (event) => {
        event.preventDefault()
        let menu = document.querySelector(`#${menuId}`)
        menu.classList.toggle(toggleClass)
    })
}

document.addEventListener("turbo:load", ()=> {
    addToggleListener("hamburger", "navbar-menu", "collapse")
    addToggleListener("account", "dropdown-menu", "active")
})