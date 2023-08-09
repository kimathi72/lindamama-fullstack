import React, {useState} from 'react';
import { BASE_URL } from "./DietBlog";

export default function AddBlog() {
    const [title, setTitle] = useState("");
    const [image, setImage] = useState("");
    const [content, setContent] = useState("");

    const handleSubmit = (e) => {
        e.preventDefault();
        const blog = {title, image, content};
        fetch(`${BASE_URL}/diet_blogs`, {
            method: 'POST',
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(blog)
        }).then(() => {
            console.log("new blog added");
        })
    }

    return (
        <div>
            <h1>Add Blog</h1>
            <form onSubmit={handleSubmit}>
                <label>Blog Title:</label>
                <input
                    type="text"
                    required
                    value={title}
                    onChange={(e) => setTitle(e.target.value)}
                />
                <label>Blog Image:</label>
                <input
                    type="text"
                    required
                    value={image}
                    onChange={(e) => setImage(e.target.value)}
                />
                <label>Blog Content:</label>
                <textarea
                    required
                    value={content}
                    onChange={(e) => setContent(e.target.value)}
                ></textarea>
                <button>Add Blog</button>
            </form>
        </div>
    )
}
