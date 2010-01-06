// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var geocoder;
var address;

function initialize(){
    geocoder = new GClientGeocoder();
}

// addAddressToMap() is called when the geocoder returns an
// answer.  It adds a marker to the map with an open info window
// showing the nicely formatted version of the address and the country code.
function addAddressToInput(response){

    if (!response || response.Status.code != 200) {
        alert("Die Adresse konnte nicht gefunden werden");
    }
    else {
        place = response.Placemark[0];
        document.getElementById('user_common_coordinates').value = place.Point.coordinates;
		var probe;
		probe = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.LocalityName;
		alert(probe);
        //document.getElementById('user_common_street').value = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Thoroughfare.ThoroughfareName;
        //document.getElementById('user_common_zip').value = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.PostalCode.PostalCodeNumber;
        //document.getElementById('user_common_city').value = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.LocalityName;
        //document.getElementById('user_common_state').value = place.AddressDetails.Country.CountryNameCode;
        //document.getElementById('user_administriveArea').value = place.AddressDetails.Country.AdministrativeArea.AdministrativeAreaName;
        //document.getElementById('user_common_district').value = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.SubAdministrativeAreaName;
        //document.getElementById('user_common_administrative_area').value = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.LocalityName;
        //document.getElementById('user_zip').value = place.AddressDetails.Country.AdministrativeArea.SubAdministrativeArea.Locality.PostalCode.PostalCodeNumber;
        
    }
    
}

function validateAdress(){
    var street = document.getElementById('street_validation').value;
    var zip = document.getElementById('zip_validation').value;
    var city = document.getElementById('city_validation').value;
    this.address = street + zip + city;
    geocoder.getLocations(address, addAddressToInput);
}

function toggle_entry_textarea(){
	document.getElementById("profile_entries_new").style.display  = "none";
}
