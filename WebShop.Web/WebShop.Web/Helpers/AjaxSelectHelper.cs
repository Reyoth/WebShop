using System;
using System.Linq.Expressions;
using System.Web.Mvc;

namespace WebShop.Web.Helpers
{
    public static class AjaxSelectHelper
    {
        //creation select list remplie par ajax
        public static MvcHtmlString AjaxSelect(this HtmlHelper html, string name, string sourceUrl, string selectedValue, bool withEmpty = false)
        {
            var selectBuilder = GetBaseSelect(name.GetControlId(), name, sourceUrl, withEmpty);
            if (!string.IsNullOrWhiteSpace(selectedValue))
                selectBuilder.Attributes.Add("data-selected-id", selectedValue);

            return new MvcHtmlString(selectBuilder.ToString());
        }
        //pareille avec cascade
        public static MvcHtmlString AjaxSelect(this HtmlHelper html, string name, string sourceUrl, string selectedValue, string cascadeFromName, bool withEmpty = false)
        {
            var selectBuilder = GetBaseSelect(name.GetControlId(), name, sourceUrl, withEmpty);
            if (!string.IsNullOrWhiteSpace(selectedValue))
                selectBuilder.Attributes.Add("data-selected-id", selectedValue);
            selectBuilder.Attributes.Add("data-cascade-from", "#" + cascadeFromName.GetControlId());

            return new MvcHtmlString(selectBuilder.ToString());
        }

        public static MvcHtmlString AjaxSelectFor<TModel, TProperty>(
            this HtmlHelper<TModel> html,
            Expression<Func<TModel, TProperty>> expression,
            string sourceUrl,
            bool withEmpty = false)
        {
            string controlFullName = html.GetControlName(expression);

            var selectBuilder = GetBaseSelect(controlFullName.GetControlId(), controlFullName, sourceUrl, withEmpty);
            selectBuilder.Attributes.Add("data-selected-id", html.GetValue(expression));

            return new MvcHtmlString(selectBuilder.ToString());
        }

        public static MvcHtmlString AjaxSelectFor<TModel, TProperty, TCascadeProperty>(
            this HtmlHelper<TModel> html,
            Expression<Func<TModel, TProperty>> expression,
            Expression<Func<TModel, TCascadeProperty>> cascadeFrom,
            string sourceUrl,
            bool withEmpty = false)
        {
            string controlFullName = html.GetControlName(expression);
            string cascadeFromFullName = html.GetControlName(cascadeFrom);

            var selectBuilder = GetBaseSelect(controlFullName.GetControlId(), controlFullName, sourceUrl, withEmpty);
            selectBuilder.Attributes.Add("data-selected-id", html.GetValue(expression));
            selectBuilder.Attributes.Add("data-cascade-from", "#" + cascadeFromFullName.GetControlId());

            return new MvcHtmlString(selectBuilder.ToString());
        }

        private static TagBuilder GetBaseSelect(string controlId, string controlName, string sourceUrl, bool withEmpty)
        {
            var selectBuilder = new TagBuilder("select");
            selectBuilder.Attributes.Add("id", controlId);
            selectBuilder.Attributes.Add("name", controlName);
            selectBuilder.Attributes.Add("data-toggle", "ajaxSelect");
            selectBuilder.Attributes.Add("data-source-url", sourceUrl);
            selectBuilder.Attributes.Add("data-with-empty", withEmpty.ToString());
            selectBuilder.AddCssClass("form-control");
            return selectBuilder;
        }

        internal static string GetControlName<TModel, TProperty>(this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression)
        {
            var lambda = expression as LambdaExpression;
            var expressionString = lambda.Body.ToString().Replace(")", "");
            return expressionString.Substring(expressionString.IndexOf('.') + 1);
            //string controlName = ExpressionHelper.GetExpressionText(expression);
            //return html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(controlName);
        }

        internal static string GetControlId(this string controlName)
        {
            return TagBuilder.CreateSanitizedId(controlName);
        }

        internal static string GetControlId<TModel, TProperty>(this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression)
        {
            return TagBuilder.CreateSanitizedId(GetControlName(html, expression));
        }

        internal static string GetValue<TModel, TProperty>(this HtmlHelper<TModel> html, Expression<Func<TModel, TProperty>> expression)
        {
            var model = ModelMetadata.FromLambdaExpression(expression, html.ViewData).Model;
            return model?.ToString() ?? string.Empty;
        }
    }
}
