using CitySkyLine.BLL.Abstract;
using CitySkyLine.DAL.Concrete.EFCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CitySkyLine.WEBUI.Controllers
{
    public class LocationController : Controller
    {
        private readonly ICountryService _countryService;
        private readonly ICityService _cityService;
        private readonly IDistrictService _districtService;

        public LocationController(ICountryService countryService, ICityService cityService, IDistrictService districtService)
        {
            _countryService = countryService;
            _cityService = cityService;
            _districtService = districtService;
        }
        //public IActionResult GetDistricts(int cityId)
        //{
        //    var districts = _cityService.GetDistrictsById(cityId);
        //    return Json(districts);
        //}

        [HttpPost("postCountries")]
        public IActionResult GetCountries()
        {
            ViewBag.Districts = _districtService.GetAll();
            ViewBag.Cities = _cityService.GetAll();
            ViewBag.Countries = _countryService.GetAll();
            var countries = _countryService.GetAll();
            return Json(countries);
        }

        [HttpPost("postCities")]
        public IActionResult GetCities(int countryId)
        {
            ViewBag.Districts = _districtService.GetAll();
            ViewBag.Cities = _cityService.GetAll();
            ViewBag.Countries = _countryService.GetAll();
            var cities = _cityService.GetAll(i => i.CountryId == countryId);
            return Json(cities);
        }

        [HttpPost("postDistricts")]
        public IActionResult GetDistricts(int cityId)
        {
            ViewBag.Districts = _districtService.GetAll();
            ViewBag.Cities = _cityService.GetAll();
            ViewBag.Countries = _countryService.GetAll();
            var districts = _districtService.GetAll(i => i.CityId == cityId);
            return Json(districts);
        }
    }
}
