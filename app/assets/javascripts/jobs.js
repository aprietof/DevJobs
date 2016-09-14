$(function() {
  filterJobs();
  showPage();
})

function filterJobs() {
  // Listener on click function
  $("input.filter").on('click', function(event) {
    var html = ''
    var category = $(".category").val();
    var loc = $(".location").val().split(" ").join("+")
    var url = "/jobs?utf8=✓&category=" + category + "&location=" + loc + "&commit=Filter"
    // AJAX
    $.getJSON(url, function(jobs) {
      // Check if there are any results
      if (jobs.length == 0) {
        // Display nothing found message
        html += '<h1>Sorry, no jobs found.</h1>'
      } else {
        $.each(jobs, function(i, job) {
          // create a js Job Object using constructor
          var newJob = new Job (job.id, job.title, job.description, job.company_name, job.url, job.location, job.created_at, job["category"]["name"])
          // Create HTML
          html += '<div class="panel panel-default">'
          html += ' <div class="panel-body">'
          html += '<h3><a href="/jobs/' + newJob.id + '">' + newJob.title + '</a></h3>'
          html += '<small>' + newJob.companyName + ' | ' + newJob.createdAt() + ' | <i class="fa fa-map-marker"></i> ' + newJob.location + ' </small>'
          html += '<p>' + newJob.description.substring(0,150) + '...' + '</p>'
          html += ' </div>'
          html +='</div>'
        });
      }
      // Clear results div
      $('.results').empty();
      // Add HTML to the DOM
      $('.results').append(html);
    })
    event.preventDefault();
  });
}

function showPage() {
  // Get user Id
  var userId = $('.next').attr('data-userId')

  var jobs = []
  var idsArray = []
  // Get All User Job Applications (AJAX)
  $.get('/users/'+ userId +'/job_applications.json', function(data) {
    $.each(data, function(index, jobApp) {
      var newJob = new Job (jobApp.id, jobApp["job"]["title"], jobApp["job"]["description"],
      jobApp["job"]["company_name"], jobApp["job"]["url"], jobApp["job"]["location"],
      jobApp["job"]["created_at"], jobApp["job"]["category"]["name"])
      jobs.push(newJob);
      idsArray.push(newJob.id)
    })
  });

  $('.next').on('click', function(event) {
    var jobId = parseInt($('.next').attr('data-id'))
    var maxIndex = idsArray.length - 1
    var nextIdindex = idsArray.indexOf(jobId) + 1

    // Check if is the last job Application and start over
    if (nextIdindex > maxIndex) {
      nextIdindex = 0
    }

    //Job to show when click
    var nextJob = jobs[nextIdindex]
    // Add New HTML to the DOM
    $('h1#title').html(nextJob.title);
    $('small#posted').html('Posted: '+ nextJob.createdAt());
    $('span.category').html(nextJob.category)
    $('p#info').html('<i class="fa fa-industry"></i> ' + nextJob.companyName + ' | <i class="fa fa-map-marker"></i> ' + nextJob.location);
    $('p#description').html(nextJob.description)
    $('h5#url').html(nextJob.url)
    $('.skills').empty();

    // Update Job id
    $('.next').attr('data-id', nextJob.id)

    event.preventDefault();
  })
}

// Job Object Constructor Function
function Job (id, title, description, companyName, url, location, created_at, category) {
  this.id = id;
  this.title = title;
  this.description = description;
  this.companyName = companyName;
  this.url = url;
  this.location = location;
  this.created_at = created_at;
  this.category = category;

  // Format created_at attribute function
  this.createdAt = function() {
    var monthNames = new Array("January", "February", "March",
    "April", "May", "June", "July", "August", "September",
    "October", "November", "December");
    var date = new Date(this.created_at);
    var day = date.getDate();
    var monthFormat = date.getMonth();
    var year = date.getFullYear();
    return monthNames[monthFormat].slice(0,3) + " " + day + "," + year
  };
}
