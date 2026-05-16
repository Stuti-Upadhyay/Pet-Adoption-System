<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawHome – Find Your Perfect Pet</title>
    <link rel="stylesheet" href="/PetAdoption/css/Home11.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>
<body>

<!-- ===== HEADER ===== -->
<header class="header">
    <div class="logo">PawPatrol</div>
    <nav>
        <ul>
            <li><a href="#" class="active">Home</a></li>
            <li><a href="#">Browse</a></li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact</a></li>
            
        </ul>
    </nav>
   
    <div class="nav-user">
    <a href="${pageContext.request.contextPath}/profile">
        <img src="${pageContext.request.contextPath}/images/default-image.jpg" 
             alt="Profile" class="profile-avatar">
    </a>
    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
</div>
</header>


<!-- ===== HERO ===== -->
<section class="hero">
    <div class="hero-left">
        <span class="tagline">Nepal's #1 Pet Adoption Platform</span>
        <h1>Find Your New<br>Best Friend</h1>
        <p>Every pet in our shelter has a story. They are waiting for someone like you to help them start their next chapter in a loving forever home.</p>
        <div class="hero-buttons">
            <a href="#pets" class="primary-btn">Start Browsing</a>
            <a href="#how-it-works" class="secondary-btn">How It Works</a>
        </div>
    </div>
    <div class="hero-badge">
        <div class="badge-dot"></div>
        <div class="badge-text">
            <strong>1,200+ Pets</strong>
            <span>Available for adoption</span>
        </div>
    </div>
</section>


<!-- ===== CATEGORIES ===== -->
<section class="categories-section">
    <div class="categories-top">
        <div class="categories-text">
            <h2>Browse by Category</h2>
            <p>Find through our community of adorable companions</p>
        </div>
        <div class="category-buttons">
            <button class="active" onclick="filterPets('all', this)">All</button>
            <button onclick="filterPets('dog', this)">Dogs</button>
            <button onclick="filterPets('cat', this)">Cats</button>
            <button onclick="filterPets('other', this)">Others</button>
        </div>
    </div>
</section>


<!-- ===== PET GRID ===== -->
<section class="pets-section" id="pets">
    <div class="pet-grid" id="petGrid">

        <div class="pet-card" data-type="dog">
            <div class="pet-image-wrap">
                <div class="pet-image-placeholder dog"></div>
                <span class="pet-type-badge">Dog</span>
                <span class="pet-heart" onclick="toggleHeart(this)">&#9825;</span>
            </div>
            <div class="pet-info">
                <h3>Luna</h3>
                <div class="pet-chips">
                    <span class="chip">Golden Retriever</span>
                    <span class="chip">1 year</span>
                </div>
                <p class="pet-location">Kathmandu, NP</p>
                <button class="adopt-btn" onclick="window.location.href='${pageContext.request.contextPath}/AdoptionRequestServlet?petId=1'">Adopt Now</button>
            </div>
        </div>

        <div class="pet-card" data-type="cat">
            <div class="pet-image-wrap">
                <div class="pet-image-placeholder cat"></div>
                <span class="pet-type-badge">Cat</span>
                <span class="pet-heart" onclick="toggleHeart(this)">&#9825;</span>
            </div>
            <div class="pet-info">
                <h3>Oliver</h3>
                <div class="pet-chips">
                    <span class="chip">Domestic Shorthair</span>
                    <span class="chip">2 years</span>
                </div>
                <p class="pet-location">Lalitpur, NP</p>
                <button class="adopt-btn" onclick="window.location.href='${pageContext.request.contextPath}/AdoptionRequestServlet?petId=2'">Adopt Now</button>
            </div>
        </div>

        <div class="pet-card" data-type="dog">
            <div class="pet-image-wrap">
                <div class="pet-image-placeholder dog2"></div>
                <span class="pet-type-badge">Dog</span>
                <span class="pet-heart" onclick="toggleHeart(this)">&#9825;</span>
            </div>
            <div class="pet-info">
                <h3>Milo</h3>
                <div class="pet-chips">
                    <span class="chip">Border Collie</span>
                    <span class="chip">3 years</span>
                </div>
                <p class="pet-location">Bhaktapur, NP</p>
                <button class="adopt-btn" onclick="window.location.href='${pageContext.request.contextPath}/AdoptionRequestServlet?petId=3'">Adopt Now</button>
            </div>
        </div>

        <div class="pet-card" data-type="cat">
            <div class="pet-image-wrap">
                <div class="pet-image-placeholder cat2"></div>
                <span class="pet-type-badge">Cat</span>
                <span class="pet-heart" onclick="toggleHeart(this)">&#9825;</span>
            </div>
            <div class="pet-info">
                <h3>Cleo</h3>
                <div class="pet-chips">
                    <span class="chip">Ragdoll</span>
                    <span class="chip">5 years</span>
                </div>
                <p class="pet-location">San Francisco, US</p>
                <button class="adopt-btn" onclick="window.location.href='${pageContext.request.contextPath}/AdoptionRequestServlet?petId=4'">Adopt Now</button>
            </div>
        </div>

    </div>

    <div class="explore-more">
        <a href="#" class="explore-btn">View More Pets</a>
    </div>
</section>


<!-- ===== NEWSLETTER ===== -->
<section class="newsletter">
    <div class="newsletter-left">
        <h2>Stay Updated on New Arrivals</h2>
        <p>Get your love finding updates that helps you to find a new furry friend by subscribing to our newsletter.</p>
        <a href="#" class="subscribe-btn">Subscribe</a>
    </div>
    <div class="newsletter-right">
        <div class="newsletter-image-placeholder"></div>
    </div>
</section>


<!-- ===== FOOTER ===== -->
<!-- Footer -->
<footer class="footer">
    <div class="footer-column footer-about">
        <h3>Paw Patrol Adoption</h3>
        <p>Connecting pets with loving families. Join us in giving every animal a forever home.</p>
    </div>
    <div class="footer-column footer-links">
        <h4>Quick Links</h4>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Adopt a Pet</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    <div class="footer-column footer-contact">
        <h4>Contact Us</h4>
        <p>Email: hello@pawpatrol.com</p>
        <p>Phone: +977 0986712345</p>
    </div>
</footer>

<!-- ===== SCRIPTS ===== -->
<script>
    function filterPets(type, btn) {
        document.querySelectorAll('.category-buttons button').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        document.querySelectorAll('.pet-card').forEach(card => {
            card.style.display = (type === 'all' || card.dataset.type === type) ? 'block' : 'none';
        });
    }

    function toggleHeart(el) {
        el.classList.toggle('liked');
        el.innerHTML = el.classList.contains('liked') ? '&#9829;' : '&#9825;';
    }
</script>

</body>
</html>
