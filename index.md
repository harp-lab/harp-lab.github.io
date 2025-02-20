---
layout: default
---

<p class="larger">Our research group is a joint collaboration between <span class="wsu">Washington State</span> (Thomas Gilray), <span class="uic">University of Illilnois at Chicago</span> (Sidharth Kumar), and <span class="syracuse">Syracuse</span> (Kristopher Micinski). Collectively, we and our students build the next-generation of analytic and semantic reasoning engines to tackle large-scale challenges in program analysis, security, formal methods, knowledge representation, and medical reasoning. </p>

<p class="larger">We are generously support by grants from the US National Science Foundation, ARPA-H, and DARPA. We sincerely appreciate this crucial government support!</p>

<h1 id="principal-investigators">Principal Investigators</h1>

<!-- Full-width section for professor bios -->
<div class="professor-bios">
  
  <div class="professor-card">
    <img src="assets/tom.png" alt="Tom Gilray Pic" class="professor-photo">
    <h3>Thomas Gilray</h3>
    <p class="affiliation">Washington State</p>
    <p class="specialties">Static Analysis, Programming Languages, HPC</p>
  </div>

  <div class="professor-card">
    <img src="assets/sid.jpg" alt="Sidharth Kumar" class="professor-photo">
    <h3>Sidharth Kumar</h3>
    <p class="affiliation">U. Illinois at Chicago</p>
    <p class="specialties">HPC, Data Management, GPUs, Graph Analytics</p>
  </div>

  <div class="professor-card">
    <img src="assets/kris.jpg" alt="Kristopher Micinski" class="professor-photo">
    <h3>Kristopher Micinski</h3>
    <p class="affiliation">Syracuse University</p>
    <p class="specialties">Programming Languages, Security, Automated Reasoning</p>
  </div>
</div>


# Recent Blog (and News) Articles

- Yihao Sun will present "Column-Oriented Datalog on the GPU" at AAAI '25

# Students 

{% assign generic_avatar = "/assets/student.svg" %}


<div class="people-grid">
  {% for student in site.data.students %}
	<!-- Card 1 -->
	<div class="person-card">
      {% if student.link == "" or student.link == nil %}
        <img 
          src="{{ generic_avatar }}" 
          alt="Generic Person" 
          class="person-photo"
        >
      {% else %}
        <img 
          src="{{ student.image }}" 
          alt="{{ student.name }}" 
          class="person-photo"
        >
      {% endif %}
	  <div class="person-info">
		<h3>{{ student.name }}</h3>
		<p>{{ student.affiliation }}</p>
		<a href="{{ student.link }}" target="_blank">Webpage</a>
	  </div>
	</div>
  {% endfor %}
</div>

# Publications

<!-- A single reusable dialog -->
<dialog id="bibDialog">
  <pre id="bibContent" style="font-family: monospace; text-wrap: wrap; max-width: 800px; font-size:1.3rem;"></pre>
  <button onclick="document.getElementById('bibDialog').close()">Close</button>
</dialog>

<!-- Show the dialog after clicking on a specific bib link -->
<script>
function showBib(evt) {
  // Grab the BibTeX from the link's data-bib attribute
  var bib = evt.currentTarget.getAttribute("data-bib");
  var decoded = atob(bib);
  // Put it in the dialog
  document.getElementById("bibContent").textContent = decoded;
  // Show the dialog
  document.getElementById("bibDialog").showModal();
}
</script>

<ul class="publications">
  {% for publication in site.data.publications %}
	<li class="pubitem">
		{{ publication.plaintext }} 
	  {% if publication.bibtex %}
			<a href="#" data-bib="{{publication.bibtex}}" onclick="showBib(event); return false;"><tt>[.bib]</tt></a>
		{% endif %}
		{% if publication.pdf %}
		<a href="{{publication.pdf}}">[Paper (PDF)]</a>
	  {% endif %}
		{% if publication.github %}
      <a href="{{publication.github}}" style="text-decoration:none;">[
				<img src="assets/github-mark.svg" alt="GitHub Logo" style="vertical-align:middle; margin-right:0.4rem; max-height: 20px; margin-left: 4px; margin-right:1px; margin-left:0px;">
				Code on GitHub]
			</a>
 		{% endif %} 
	</li>
	{% endfor %}
</ul>
