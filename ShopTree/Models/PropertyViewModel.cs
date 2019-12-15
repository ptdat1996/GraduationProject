using System;
using ShopTree.Common;
using System.ComponentModel.DataAnnotations;

namespace ShopTree.Models
{
    public class PropertyViewModel
    {
        public int ProductId { get; set; }

        public string ProductName { get; set; }

        public string Avatar { get; set; }

        public bool IsLikeWater { get; set; }

        public bool IsLikeSunny { get; set; }

        public int RecommendSunnyHour { get; set; }

        public int RecommendWater { get; set; }

        public int RecommendFertilizer { get; set; }

        public int RecommendTemperature { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_SUNNYHOUR)]
        [Range(1, int.MaxValue, ErrorMessage = Constants.ERR_MIN_PROPERTY)]
        public int SunnyHour { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_WATER)]
        [Range(1, int.MaxValue, ErrorMessage = Constants.ERR_MIN_PROPERTY)]
        public int Water { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_FERTILIZER)]
        [Range(1, int.MaxValue, ErrorMessage = Constants.ERR_MIN_PROPERTY)]
        public int Fertilizer { get; set; }

        [Required(ErrorMessage = Constants.ERR_REQUIRED_TEMPERATURE)]
        [Range(1, int.MaxValue, ErrorMessage = Constants.ERR_MIN_PROPERTY)]
        public int Temperature { get; set; }       
    }
}