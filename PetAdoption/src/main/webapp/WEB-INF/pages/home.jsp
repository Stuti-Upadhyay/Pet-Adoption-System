<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home – PetAdoption</title>

<link rel="stylesheet" href="css/home.css">

</head>
<body>

<!-- NAVBAR -->
<nav class="navbar">
  <div class="nav-brand">
    <div class="brand-icon"></div>
    PetAdoption
  </div>

  <div class="nav-links">
    <a class="active">Home</a>
    <a href="#about">About</a>
    <a href="#contact">Contact</a>
  </div>

  <div class="nav-user">
    <a href="login" class="btn-danger">Logout</a>
  </div>
</nav>

<!-- MAIN -->
<div class="main-content">

  <!-- HERO -->
  <div class="page-hero">
    <h2>Find Your Perfect Pet Friend</h2>
    <p>Browse pets waiting for a loving home</p>

    <div class="hero-tags">
      <div class="tag tag-all" onclick="filterPets('all')">All</div>
      <div class="tag tag-dog" onclick="filterPets('dog')">Dog</div>
      <div class="tag tag-cat" onclick="filterPets('cat')">Cat</div>
    </div>
  </div>

  <!-- SECTION -->
  <div class="section-header">
    <h3>Available Pets</h3>
  </div>

  <div class="pets-grid">

    <!-- DOGS -->
    <div class="pet-card" data-type="dog">
        <div class="pet-card-image card-bg-yellow"></div>
        <div class="pet-card-body">
            <div class="pet-name">Buddy</div>
            <div class="pet-meta">
                <div class="pet-chip">Dog</div>
                <div class="pet-chip">Golden Retriever</div>
            </div>
            <div class="pet-meta">
                <div class="pet-chip">Age: 2 yrs</div>
            </div>
            <button class="btn-adopt">Adopt</button>
        </div>
    </div>

    <div class="pet-card" data-type="dog">
        <div class="pet-card-image card-bg-yellow"></div>
        <div class="pet-card-body">
            <div class="pet-name">Max</div>
            <div class="pet-meta">
                <div class="pet-chip">Dog</div>
                <div class="pet-chip">Beagle</div>
            </div>
            <div class="pet-meta">
                <div class="pet-chip">Age: 3 yrs</div>
            </div>
            <button class="btn-adopt">Adopt</button>
        </div>
    </div>

    <div class="pet-card" data-type="dog">
        <div class="pet-card-image card-bg-yellow"></div>
        <div class="pet-card-body">
            <div class="pet-name">Rocky</div>
            <div class="pet-meta">
                <div class="pet-chip">Dog</div>
                <div class="pet-chip">German Shepherd</div>
            </div>
            <div class="pet-meta">
                <div class="pet-chip">Age: 1 yr</div>
            </div>
            <button class="btn-adopt">Adopt</button>
        </div>
    </div>

    <!-- CATS -->
    <div class="pet-card" data-type="cat">
        <div class="pet-card-image card-bg-lavender"></div>
        <div class="pet-card-body">
            <div class="pet-name">Luna</div>
            <div class="pet-meta">
                <div class="pet-chip">Cat</div>
                <div class="pet-chip">Persian</div>
            </div>
            <div class="pet-meta">
                <div class="pet-chip">Age: 2 yrs</div>
            </div>
            <button class="btn-adopt">Adopt</button>
        </div>
    </div>

    <div class="pet-card" data-type="cat">
        <div class="pet-card-image card-bg-lavender"></div>
        <div class="pet-card-body">
            <div class="pet-name">Milo</div>
            <div class="pet-meta">
                <div class="pet-chip">Cat</div>
                <div class="pet-chip">Siamese</div>
            </div>
            <div class="pet-meta">
                <div class="pet-chip">Age: 1 yr</div>
            </div>
            <button class="btn-adopt">Adopt</button>
        </div>
    </div>

    <div class="pet-card" data-type="cat">
        <div class="pet-card-image card-bg-lavender"></div>
        <div class="pet-card-body">
            <div class="pet-name">Bella</div>
            <div class="pet-meta">
                <div class="pet-chip">Cat</div>
                <div class="pet-chip">British Shorthair</div>
            </div>
            <div class="pet-meta">
                <div class="pet-chip">Age: 4 yrs</div>
            </div>
            <button class="btn-adopt">Adopt</button>
        </div>
    </div>

    <div class="pet-card" data-type="cat">
        <div class="pet-card-image card-bg-lavender"></div>
        <div class="pet-card-body">
            <div class="pet-name">Oliver</div>
            <div class="pet-meta">
                <div class="pet-chip">Cat</div>
                <div class="pet-chip">Maine Coon</div>
            </div>
            <div class="pet-meta">
                <div class="pet-chip">Age: 3 yrs</div>
            </div>
            <button class="btn-adopt">Adopt</button>
        </div>
    </div>

  </div>


<!-- FILTER SCRIPT -->
<script>
function filterPets(type) {
    let cards = document.querySelectorAll(".pet-card");

    cards.forEach(card => {
        let petType = card.getAttribute("data-type");

        if(type === "all" || petType === type) {
            card.style.display = "block";
        } else {
            card.style.display = "none";
        }
    });
}
</script>

</body>
</html>