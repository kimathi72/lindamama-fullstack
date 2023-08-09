import './DietBlog.css';
import { useState, useEffect } from 'react'
import ReactPaginate from 'react-paginate';



export const BASE_URL = "http://127.0.0.1:3000"

function Card({image, title}){
    return(
        <div className="card">
            <div className="card-image">
               <img src={image} alt={title} />
            </div>
            <div className="card-title">
                <span>{title}</span>
            </div>
        </div>
    );

}

export default function DietBlog() {
    const [blogPosts, setBlogPosts] = useState([]);



    const [currentPage, setCurrentPage] = useState(1);
    const [postsPerPage] = useState(3);

    const paginate = ({ selected }) => {
        setCurrentPage(selected + 1);
     };

    const indexOfLastPost = currentPage * postsPerPage;
    const indexOfFirstPost = indexOfLastPost - postsPerPage;
    const currentPosts = blogPosts.slice(indexOfFirstPost, indexOfLastPost);

    useEffect(() => {
        fetch(`${BASE_URL}/diet_blogs`)
        .then(response => response.json())
        .then(data => setBlogPosts(data));
    }, []);



console.log(blogPosts)
    return (
        <div>
        <div className="header">
            <h1>Diet Blog</h1>
            <span className="subheading">A collection of diet blogs</span>
        </div>
            <div className="card-container">

            {currentPosts.map((post, index) => (
    <a href={`/blog/${post.id}`} key={index}>
        <Card image={post.image} title={post.title} />
    </a>
        ))}

               <ReactPaginate
                  onPageChange={paginate}
                  pageCount={Math.ceil(blogPosts.length / postsPerPage)}
                  previousLabel={'Prev'}
                  nextLabel={'Next'}
                  containerClassName={'pagination'}
                  pageLinkClassName={'page-number'}
                  previousLinkClassName={'page-number'}
                  nextLinkClassName={'page-number'}
                  activeLinkClassName={'active'}
               />


            </div>




        </div>

    )

}