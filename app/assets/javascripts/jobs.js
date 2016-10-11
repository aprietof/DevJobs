// Job Object Constructor Function
function Job(id, title, description, companyName, url, location, created_at, category) {
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
        // Returns date in "Sep 2,2016" format 
        return monthNames[monthFormat].slice(0, 3) + " " + day + "," + year
    };
}
