{{ 'stylesheet' | jhtml: 'css/style.css' }}
<div class="jkassa jk-manufacturers-module">
	{% if manufacturers %}
	  {% case layout %}
		{% when 'blocks' %}
		  {% include 'modules/manufacturers/blocks' %}
		{% when 'carousel' %}
		  <style type="text/css">
			.jk-manufacturers-module .carousel-inner {
				margin-left: 35px;
				margin-right: 35px;
				width: auto;
			}
			.jk-manufacturers-module .carousel-control {
				background: #ccc;
				border: 2px solid #265a82;
				color: #265a82;
				font-size: 40px;
				font-weight: 100;
				height: 26px;
				left: auto;
				line-height: 18px;
				width: 26px;
			}
			.jk-manufacturers-module .carousel-control.right { right: 0; }
			.jk-manufacturers-module .carousel-indicators .active { background-color: #ccc; }
			.jk-manufacturers-module .carousel-indicators li { background-color: #265a82; }
			@media (min-width: 768px) and (max-width: 979px) {
				.jk-manufacturers-module .carousel-inner {
					margin-left: auto;
					margin-right: auto;
					width: 100%;
				}
				.jk-manufacturers-module .control-box {
					display: block;
					text-align: center;
				}
				.jk-manufacturers-module .carousel-control {
					display: inline-block;
					position: static;
				}
			}
		  </style>
		  {% include 'modules/manufacturers/carousel' %}
		{% else %}
		  {% include 'modules/manufacturers/list' %}
	  {% endcase %}
	{% else %}
	  <div class="alert alert-block">
		{{ '_' | jtext: 'JNONE' }}
	  </div>
	{% endif %}
</div>