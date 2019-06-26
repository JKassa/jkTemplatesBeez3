<div class="center jk-cheaper carousel slide" id="cheaperCarousel">
  <!-- Carousel items -->
  <div class="carousel-inner">
    {% for together in cheaper %}
      {% for cheap in together.cheaper %}
      <ul class="items-row cols-3 categories-module item {% if cheap.active %}active{% endif %}">
        <li class="column-1 text-center">
          <!--Product Image-->
          <div>
            <img {{ together.image | img_exists: '50x70' }} style="max-height: 30%; max-width: 30%;" alt="{{ together.alias }}" />
          </div>
          <!--Name product-->
          <h5>
            {{ together.name }}
          </h5>
          <!--Price product-->
          <div>
            {% if together.old_cost %}
            <!--old cost-->
            <del>
              {{ together.old_cost | costDisplay }}{{ currency.symbol }}
            </del>
            {% endif %}
            <!--cost-->
            <span class="cost">
              <span>{{ together.cost | costDisplay }}</span>{{ currency.symbol }}
            </span>
          </div>
        </li>
        <li class="column-2 text-center">
          <!--Product Image-->
          <div>
            <img {{ cheap.image | img_exists: '50x70' }} style="max-height: 30%; max-width: 30%;" alt="{{ cheap.alias }}" />
          </div>
          <!--Name and URL product-->
          <h5>
            <a href="{{ cheap.url }}">
              {{ cheap.name }}
            </a>
          </h5>
          <!--SKU (code)-->
          <small>
            {{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ cheap.sku }}
          </small>
          <!--Price product-->
          <div class="cost">
            <!--old cost-->
            <del>
              {{ cheap.old_cost | costDisplay }}{{ currency.symbol }}
            </del>
            <!--cost-->
            <span>{{ cheap.cost | costDisplay }}</span>{{ currency.symbol }}
          </div>
        </li>
        <li class="column-3 text-center">
          <div class="cost">
            <!--old price-->
            <del>
              {{ cheap.old_price | costDisplay }}{{ currency.symbol }}
            </del>
            <br>
            <!--new price-->
            <span>{{ cheap.new_price | costDisplay }}</span>{{ currency.symbol }}
          </div>
          <!--discount-->
          <div class="discount">
            {{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }} {{ cheap.difference | costDisplay }}{{ currency.symbol }}
			{% if cheap.percent %}
		    <small>({{ cheap.discount }}%)</small>
		    {% endif %}
          </div>
          <!--Add to cart-->
          <div>
            <a href="#" data-click="to-cart" data-id="{{ cheap.id }}" class="button" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', cheap.name }}">
              {{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
            </a>
          </div>
        </li>
      </ul>
      {% endfor %}
    {% endfor %}
  </div>
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#cheaperCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#cheaperCarousel" data-slide="next">&rsaquo;</a>
</div>
<script>
jQuery(document).ready(function ()
{
	jQuery('#cheaperCarousel').carousel({interval: false});
	
	// carousel fix conflict with mootools
	if (typeof jQuery != 'undefined' && typeof MooTools != 'undefined' ) {
		Element.implement({
			slide: function(how, mode){
				return this;
			}
		});
	};
});
</script>