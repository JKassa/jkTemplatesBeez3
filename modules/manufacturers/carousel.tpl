{% assign rows		= manufacturers | arrayChunk: 4 %}
{% assign active	= 0 %}
{% assign dataslide	= 0 %}

<div class="carousel slide mjkcarousel" id="mjkmCarousel_{{ mod_id }}">
  <ol class="carousel-indicators">
    {% for row in rows %}
    <li data-target="#mjklCarousel_{{ mod_id }}" data-slide-to="{{ dataslide }}" class="{% if dataslide == 0 %}active{% endif %}"></li>
    {% assign dataslide = dataslide | plus: 1 %}
    {% endfor %}
  </ol>
  <div class="carousel-inner">
    {% for row in rows %}
    {% assign active = active | plus: 1 %}
    <div class="item {% if active == 1 %}active{% endif %}">
      <ul class="items-row cols-3">
        {% assign rowcount = 0 %}
		{% for manufacturer in row %}
			{% assign rowcount = rowcount | plus: 1 %}
		  	<li class="item column-{{ rowcount }}">
			  <div class="article-info">
				<div style="height: {{ block_height }}px">
				  {% if manufacturer.thumbnail %}
				  <div class="manufacturer-thumbnail" style="text-align: center">
					<a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
					  <img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 75px; max-width: 75px" />
					</a>
				  </div>
				  {% endif %}
				  <div class="caption">
					<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
					  <a href="{{ manufacturer.url }}" title="{{ manufacturer.name }}">
						{{ manufacturer.name }}
					  </a>
					  {% if products %}
					  <small>({{ 'plural' | jtext: 'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }})</small>
					  {% endif %}
					</div>
					{% if manufacturer.introtext %}
					<p style="font-size: 11px; line-height: 14px">
					  {{ manufacturer.introtext | truncateDesc: 35 }}
					</p>
					{% endif %}
					{% if readmore %}
				    <p>
					  <a class="button" href="{{ manufacturer.url }}">
					    {{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
					  </a>
				    </p>
				    {% endif %}
				  </div>
				</div>
			  </div>
			</li>
		    {% if rowcount == 3 %}{% assign rowcount = 0 %}{% endif %}
        {% endfor %}
      </ul>
    </div>
    {% endfor %}
  </div>
  <div class="control-box">
	  <a data-slide="prev" href="#mjkmCarousel_{{ mod_id }}" class="carousel-control left">&lsaquo;</a>
	  <a data-slide="next" href="#mjkmCarousel_{{ mod_id }}" class="carousel-control right">&rsaquo;</a>
  </div>
</div>

{{ 'bootstrap.framework' | jhtml }}
<script>
jQuery(document).ready(function ()
{
	jQuery('#mjkmCarousel_{{ mod_id }}').carousel({
		interval: 6000,
		string: "hover"
	});
	
	// carousel fix conflict with mootools
	if (typeof jQuery != 'undefined' && typeof MooTools != 'undefined' ) {
		Element.implement({
			slide: function(how, mode){
				return this;
			}
		});
	}
});
</script>