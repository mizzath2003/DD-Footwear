const collapsibles = document.getElementsByClassName("collapsible");
const sidebar = document.querySelector(".sidebar");
const hamburger = document.querySelector(".hamburger");
const mainbody = document.querySelector(".mainSec");

for (let i = 0; i < collapsibles.length; i++) {
  collapsibles[i].addEventListener("mouseover", function () {
    this.classList.toggle("active");
    const content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}

// Retrieve the sidebar state from local storage
const sidebarState = localStorage.getItem("sidebarState");
if (sidebarState === "closed") {
  mainbody.classList.remove("open");
  sidebar.classList.remove("open");
  hamburger.classList.remove("open");
}

//   hamburger.addEventListener("click", toggleSidebar);
//   hamburger.addEventListener("hover", toggleSidebar);

function toggleSidebar() {
  sidebar.classList.toggle("open");
  hamburger.classList.toggle("open");
  mainbody.classList.toggle("open");

  // Save the sidebar state to local storage
  if (sidebar.classList.contains("open")) {
    localStorage.setItem("sidebarState", "open");
  } else {
    localStorage.setItem("sidebarState", "closed");
  }
}
