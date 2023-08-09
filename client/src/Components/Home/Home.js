
import React from "react";
import BannerBackground from "./Assets/home-banner-background.png";
import { FiArrowRight } from "react-icons/fi";
import './Home.css'

import About from "./About";
import Work from "./Work";
import Testimonial from "./Testimonial.js";

const Home = () => {
  return (
    <div className="home-container">
      <div className="home-banner-container">
        <div className="home-bannerImage-container">
          <img src={BannerBackground} alt="" />
        </div>
        <div className="home-text-section">
          <h1 className="primary-heading">
            Your Favorite Health Care Providers.
          </h1>
          <p className="primary-text">
            Sign up to have a stress free and well-informed pregnancy experience.
          </p>
          <button className="secondary-button">
            Sign Up<FiArrowRight />{" "}
          </button>
        </div>
      </div>
      <Work/>
      <About/>
    <Testimonial/>
    </div>




  );
};

export default Home;
