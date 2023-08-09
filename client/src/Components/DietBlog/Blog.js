import "./DietBlog.css"
import { useParams } from "react-router-dom"
import { BASE_URL } from "./DietBlog";
import { useState, useEffect } from 'react'

const NUM_BLOGS = 6;

export default function Blog() {
    //get id from url
    const { id } = useParams();

    const next_blog = () => {
        let id_int = parseInt(id)
        if (id_int+1 > 6) return 1
        return id_int+1
    }
    //fetch blog post with id
    const [blogPost, setBlogPost] = useState([]);

    useEffect(() => {
        fetch(`${BASE_URL}/diet_blogs/${id}`)
        .then(response => response.json())
        .then(data => {
            data.content = data.content.replace(/(\r\n|\n|\r)/gm, "<br>");
            setBlogPost(data);
        })
    }, []);

    console.log(blogPost);



    return (
        <div className="blog-container">
            <div className="blog-nav">
            <div className="nav-blog-buttons">
                <a href="/">Back</a>
                <a href={`/blog/${next_blog()}`}>Next</a>
            </div>

            <h1 className="blogpost-title">{blogPost.title}</h1>
            </div>
            <div className="blog-image">
                <img src={blogPost.image} alt={blogPost.title} />
            </div>


            <div className="blog-content">
                <div dangerouslySetInnerHTML={{__html: blogPost.content}} className="blog-post-content">

                </div>
            </div>
        </div>
    )
}
