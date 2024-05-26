using AutoMapper;
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
        private readonly IMapper _mapper;

        public LocationController(ICountryService countryService, ICityService cityService, IDistrictService districtService, IMapper mapper)
        {
            _countryService = countryService;
            _cityService = cityService;
            _districtService = districtService;
            _mapper = mapper;
        }
        //public IActionResult GetDistricts(int cityId)
        //{
        //    var districts = _cityService.GetDistrictsById(cityId);
        //    return Json(districts);
        //}

        [HttpGet("getCountries")]
        public IActionResult GetCountries()
        {
            var countries = _countryService.GetAll();
            return Json(countries);
        }

        [HttpGet("getCities")]
        public IActionResult GetCities(int countryId)
        {
            var cities = _cityService.GetCitiesById(countryId);
            return Json(cities);
        }

        [HttpGet("getDistricts")]
        public IActionResult GetDistricts(int cityId)
        {
            var districts = _districtService.GetDistrictsById(cityId);
            return Json(districts);
        }
    }
}
