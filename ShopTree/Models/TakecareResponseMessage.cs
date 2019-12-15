using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopTree.Models
{
    public class TakecareResponseMessage
    { 
        public bool IsEnoughSunnyHour { get; set; }
        public bool IsEnoughWater { get; set; }
        public bool IsEnoughFertilizer { get; set; }
        public bool IsEnoughTemperature { get; set; }
        public string AdviceSunnyHour { get; set; }
        public string AdviceWater { get; set; }
        public string AdviceFertilizer { get; set; }
        public string AdviceTemperature { get; set; }
    }
}