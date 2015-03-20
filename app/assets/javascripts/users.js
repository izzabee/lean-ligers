document.addEventListener("DOMContentLoaded", function(event) {

  var pmMentors = [];
  var uxMentors = [];
  var webMentors = [];
  var select = document.getElementById("careerSelect");
  var careerHeader = document.getElementById("career-header");
  var description = document.getElementById("career-description");
  var minSal = document.getElementById("minSalary");
  var medSal = document.getElementById("medSalary");
  var maxSal = document.getElementById("maxSalary");
  var salaryInfo = document.getElementById("salaryInfo");

  var descriptionAll = "Here you can see all of the mentors on CareerCupid! If you’d like to search by career, select your preference above.";

  var descriptionPM = "The Product Manager is responsible for the product planning and execution throughout the product lifecycle, including: gathering and prioritizing product and customer requirements, defining the product vision, and working closely with engineering, sales, marketing and support to ensure revenue and customer satisfaction goals are met. The Product Manager’s job also includes ensuring that the product supports the company’s overall strategy and goals.";

  var pmMin = "45,676";
  var pmMed = "78,16";
  var pmMax = "111,392";

  var descriptionUX = "UX designers are primarily concerned with how the product feels. A given design problem has no single right answer. UX designers explore many different approaches to solving a specific user problem. The broad responsibility of a UX designer is to ensure that the product logically flows from one step to the next. One way that a UX designer might do this is by conducting in-person user tests to observe one's behavior. By identifying verbal and nonverbal stumbling blocks, they refine and iterate to create the \"best\" user experience.";

  var uxMin = "47,119";
  var uxMed = "61,283";
  var uxMax = "73,238";

  var descriptionWeb = "A web designer/developer is responsible for the design, layout and coding of a website. They are involved with the technical and graphical aspects of a website - how the site works and how it looks. They can also be involved with the maintenance and update of an existing site.";

  var webMin = "34,103";
  var webMed = "58,583";
  var webMax = "88,736";

  //grab all mentor cards
  var pmCards = document.getElementsByClassName("mentor-pm");
  for (var i = 0; i < pmCards.length; i++) {
    pmMentors.push(pmCards[i]);
  }

  var uxMentors = [];
  var uxCards = document.getElementsByClassName("mentor-ux");
  for (var i = 0; i < uxCards.length; i++) {
    uxMentors.push(uxCards[i]);
  }

  var webMentors = [];
  var webCards = document.getElementsByClassName("mentor-web");
  for (var i = 0; i < webCards.length; i++) {
    webMentors.push(webCards[i]);
  }

  careerHeader.style.display = "none";
  salaryInfo.style.display = "none";

  select.onchange = function() {
    var career = select.value;
    if (career === "all") {
      displayMentors(pmMentors);
      displayMentors(uxMentors);
      displayMentors(webMentors);
      description.innerHTML = descriptionAll;
      careerHeader.style.display = "none";
      salaryInfo.style.display = "none";
    }
    if (career === "product") {
      careerHeader.style.display = "block";
      salaryInfo.style.display = "block";
      displayMentors(pmMentors);
      description.innerHTML = descriptionPM;
      hideMentors(uxMentors);
      hideMentors(webMentors);
      minSal.innerHTML = pmMin;
      medSal.innerHTML = pmMed;
      maxSal.innerHTML = pmMax;
    }
    if (career === "design") {
      careerHeader.style.display = "block";
      salaryInfo.style.display = "block";
      displayMentors(uxMentors);
      description.innerHTML = descriptionUX;
      hideMentors(pmMentors);
      hideMentors(webMentors);
      minSal.innerHTML = uxMin;
      medSal.innerHTML = uxMed;
      maxSal.innerHTML = uxMax;
    }
    if (career === "dev") {
      careerHeader.style.display = "block";
      salaryInfo.style.display = "block";
      displayMentors(webMentors);
      description.innerHTML = descriptionWeb;
      hideMentors(pmMentors);
      hideMentors(uxMentors);
      minSal.innerHTML = webMin;
      medSal.innerHTML = webMed;
      maxSal.innerHTML = webMax;
    }
  };

  function displayMentors(array){
    array.forEach(function(each){
      each.style.display = "block";
    })
  };

  function hideMentors(array){
    array.forEach(function(each){
      each.style.display = "none";
    })
  };

});
