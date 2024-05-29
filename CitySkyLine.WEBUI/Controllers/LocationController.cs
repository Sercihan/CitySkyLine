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
        public IActionResult GetCountries()
        {
            ViewBag.Districts = _districtService.GetAll();
            ViewBag.Cities = _cityService.GetAll();
            ViewBag.Countries = _countryService.GetAll();
            var countries = _countryService.GetAll();
            return Json(countries);
        }


        public IActionResult GetCities(int countryId)
        {
            var cities = _cityService.GetByCountryId(countryId);
            return Json(cities);
        }


        public IActionResult GetDistricts(int cityId)
        {
            var districts = _districtService.GetByCityId(cityId);
            return Json(districts);
        }
    }
}
