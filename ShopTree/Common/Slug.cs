using System.Text;
using System.Text.RegularExpressions;

namespace ShopTree.Common
{
    public class Slug
    {
        public static string GenerateSlug(int id, string name)
        {
            string slug = string.Format("{0}-{1}", name, id).ToLower();

            //regex check unicode
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");

            //separate string into a letter and an accent
            slug = slug.Normalize(NormalizationForm.FormD);

            //remove all accent and turn 'đ' to 'd'
            slug = regex.Replace(slug, string.Empty).Replace('\u0111', 'd');

            //add hyphen into letter
            slug = Regex.Replace(slug, @"\s", "-");
            return slug;
        }

        public static string CreateSlug(string name)
        {
            string slug = name.ToLower();

            //regex check unicode
            Regex regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");

            //separate string into a letter and an accent
            slug = slug.Normalize(NormalizationForm.FormD);

            //remove all accent and turn 'đ' to 'd'
            slug = regex.Replace(slug, string.Empty).Replace('\u0111', 'd');

            //add hyphen into letter
            slug = Regex.Replace(slug, @"\s", "-");
            return slug;
        }
    }
}