async function loadPosts(){

const res = await fetch("posts/posts.json")

const posts = await res.json()

const list = document.getElementById("post-list")

if(!list) return

posts.forEach(post=>{

const div = document.createElement("div")

div.className="post"

div.innerHTML = `

<h2>
<a href="post.html?id=${post.id}">
${post.title}
</a>
</h2>

<p>${post.date}</p>

<p>${post.summary}</p>

`

list.appendChild(div)

})

}

async function loadPost(){

const params = new URLSearchParams(location.search)

const id = params.get("id")

if(!id) return

const res = await fetch("posts/posts.json")

const posts = await res.json()

const post = posts.find(p=>p.id==id)

if(!post) return

document.getElementById("title").innerText = post.title
document.getElementById("date").innerText = post.date
document.getElementById("content").innerHTML = post.content

}

function toggleDark(){

document.body.classList.toggle("dark")

}

loadPosts()
loadPost()
