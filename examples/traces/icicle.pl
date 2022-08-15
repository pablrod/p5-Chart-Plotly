use Chart::Plotly;
use Chart::Plotly::Plot;
use JSON;
use Chart::Plotly::Trace::Icicle;

# Example from https://github.com/plotly/plotly.js/blob/9a57346d35f28a7969beea9e0fc35e13932275c6/test/image/mocks/icicle_coffee.json
my $trace1 = Chart::Plotly::Trace::Icicle->new({'parents' => ['', '', 'Aromas', 'Aromas', 'Aromas', 'Tastes', 'Tastes', 'Tastes', 'Tastes', 'Aromas-Enzymatic', 'Aromas-Enzymatic', 'Aromas-Enzymatic', 'Aromas-Sugar Browning', 'Aromas-Sugar Browning', 'Aromas-Sugar Browning', 'Aromas-Dry Distillation', 'Aromas-Dry Distillation', 'Aromas-Dry Distillation', 'Tastes-Bitter', 'Tastes-Bitter', 'Tastes-Salt', 'Tastes-Salt', 'Tastes-Sweet', 'Tastes-Sweet', 'Tastes-Sour', 'Tastes-Sour', 'Enzymatic-Flowery', 'Enzymatic-Flowery', 'Enzymatic-Fruity', 'Enzymatic-Fruity', 'Enzymatic-Herby', 'Enzymatic-Herby', 'Sugar Browning-Nutty', 'Sugar Browning-Nutty', 'Sugar Browning-Carmelly', 'Sugar Browning-Carmelly', 'Sugar Browning-Chocolatey', 'Sugar Browning-Chocolatey', 'Dry Distillation-Resinous', 'Dry Distillation-Resinous', 'Dry Distillation-Spicy', 'Dry Distillation-Spicy', 'Dry Distillation-Carbony', 'Dry Distillation-Carbony', 'Bitter-Pungent', 'Bitter-Pungent', 'Bitter-Harsh', 'Bitter-Harsh', 'Salt-Sharp', 'Salt-Sharp', 'Salt-Bland', 'Salt-Bland', 'Sweet-Mellow', 'Sweet-Mellow', 'Sweet-Acidy', 'Sweet-Acidy', 'Sour-Winey', 'Sour-Winey', 'Sour-Soury', 'Sour-Soury', 'Flowery-Floral', 'Flowery-Floral', 'Flowery-Fragrant', 'Flowery-Fragrant', 'Fruity-Citrus', 'Fruity-Citrus', 'Fruity-Berry-like', 'Fruity-Berry-like', 'Herby-Alliaceous', 'Herby-Alliaceous', 'Herby-Leguminous', 'Herby-Leguminous', 'Nutty-Nut-like', 'Nutty-Nut-like', 'Nutty-Malt-like', 'Nutty-Malt-like', 'Carmelly-Candy-like', 'Carmelly-Candy-like', 'Carmelly-Syrup-like', 'Carmelly-Syrup-like', 'Chocolatey-Chocolate-like', 'Chocolatey-Chocolate-like', 'Chocolatey-Vanilla-like', 'Chocolatey-Vanilla-like', 'Resinous-Turpeny', 'Resinous-Turpeny', 'Resinous-Medicinal', 'Resinous-Medicinal', 'Spicy-Warming', 'Spicy-Warming', 'Spicy-Pungent', 'Spicy-Pungent', 'Carbony-Smokey', 'Carbony-Smokey', 'Carbony-Ashy', 'Carbony-Ashy', ], 'pathbar' => {'visible' => JSON::false, }, 'textinfo' => 'label+percent parent', 'ids' => ['Aromas', 'Tastes', 'Aromas-Enzymatic', 'Aromas-Sugar Browning', 'Aromas-Dry Distillation', 'Tastes-Bitter', 'Tastes-Salt', 'Tastes-Sweet', 'Tastes-Sour', 'Enzymatic-Flowery', 'Enzymatic-Fruity', 'Enzymatic-Herby', 'Sugar Browning-Nutty', 'Sugar Browning-Carmelly', 'Sugar Browning-Chocolatey', 'Dry Distillation-Resinous', 'Dry Distillation-Spicy', 'Dry Distillation-Carbony', 'Bitter-Pungent', 'Bitter-Harsh', 'Salt-Sharp', 'Salt-Bland', 'Sweet-Mellow', 'Sweet-Acidy', 'Sour-Winey', 'Sour-Soury', 'Flowery-Floral', 'Flowery-Fragrant', 'Fruity-Citrus', 'Fruity-Berry-like', 'Herby-Alliaceous', 'Herby-Leguminous', 'Nutty-Nut-like', 'Nutty-Malt-like', 'Carmelly-Candy-like', 'Carmelly-Syrup-like', 'Chocolatey-Chocolate-like', 'Chocolatey-Vanilla-like', 'Resinous-Turpeny', 'Resinous-Medicinal', 'Spicy-Warming', 'Spicy-Pungent', 'Carbony-Smokey', 'Carbony-Ashy', 'Pungent-Creosol', 'Pungent-Phenolic', 'Harsh-Caustic', 'Harsh-Alkaline', 'Sharp-Astringent', 'Sharp-Rough', 'Bland-Neutral', 'Bland-Soft', 'Mellow-Delicate', 'Mellow-Mild', 'Acidy-Nippy', 'Acidy-Piquant', 'Winey-Tangy', 'Winey-Tart', 'Soury-Hard', 'Soury-Acrid', 'Floral-Coffee Blossom', 'Floral-Tea Rose', 'Fragrant-Cardamon Caraway', 'Fragrant-Coriander Seeds', 'Citrus-Lemon', 'Citrus-Apple', 'Berry-like-Apricot', 'Berry-like-Blackberry', 'Alliaceous-Onion', 'Alliaceous-Garlic', 'Leguminous-Cucumber', 'Leguminous-Garden Peas', 'Nut-like-Roasted Peanuts', 'Nut-like-Walnuts', 'Malt-like-Balsamic Rice', 'Malt-like-Toast', 'Candy-like-Roasted Hazelnut', 'Candy-like-Roasted Almond', 'Syrup-like-Honey', 'Syrup-like-Maple Syrup', 'Chocolate-like-Bakers', 'Chocolate-like-Dark Chocolate', 'Vanilla-like-Swiss', 'Vanilla-like-Butter', 'Turpeny-Piney', 'Turpeny-Blackcurrant-like', 'Medicinal-Camphoric', 'Medicinal-Cineolic', 'Warming-Cedar', 'Warming-Pepper', 'Pungent-Clove', 'Pungent-Thyme', 'Smokey-Tarry', 'Smokey-Pipe Tobacco', 'Ashy-Burnt', 'Ashy-Charred', ], 'labels' => ['Aromas', 'Tastes', 'Enzymatic', 'Sugar Browning', 'Dry Distillation', 'Bitter', 'Salt', 'Sweet', 'Sour', 'Flowery', 'Fruity', 'Herby', 'Nutty', 'Carmelly', 'Chocolatey', 'Resinous', 'Spicy', 'Carbony', 'Pungent', 'Harsh', 'Sharp', 'Bland', 'Mellow', 'Acidy', 'Winey', 'Soury', 'Floral', 'Fragrant', 'Citrus', 'Berry-like', 'Alliaceous', 'Leguminous', 'Nut-like', 'Malt-like', 'Candy-like', 'Syrup-like', 'Chocolate-like', 'Vanilla-like', 'Turpeny', 'Medicinal', 'Warming', 'Pungent', 'Smokey', 'Ashy', 'Creosol', 'Phenolic', 'Caustic', 'Alkaline', 'Astringent', 'Rough', 'Neutral', 'Soft', 'Delicate', 'Mild', 'Nippy', 'Piquant', 'Tangy', 'Tart', 'Hard', 'Acrid', 'Coffee Blossom', 'Tea Rose', 'Cardamon Caraway', 'Coriander Seeds', 'Lemon', 'Apple', 'Apricot', 'Blackberry', 'Onion', 'Garlic', 'Cucumber', 'Garden Peas', 'Roasted Peanuts', 'Walnuts', 'Balsamic Rice', 'Toast', 'Roasted Hazelnut', 'Roasted Almond', 'Honey', 'Maple Syrup', 'Bakers', 'Dark Chocolate', 'Swiss', 'Butter', 'Piney', 'Blackcurrant-like', 'Camphoric', 'Cineolic', 'Cedar', 'Pepper', 'Clove', 'Thyme', 'Tarry', 'Pipe Tobacco', 'Burnt', 'Charred', ], });


my $plot = Chart::Plotly::Plot->new(
    traces => [$trace1, ],
    layout => 
        {'margin' => {'t' => 0, 'l' => 0, 'b' => 0, 'r' => 0, }, 'shapes' => [{'x0' => 0, 'y1' => 1, 'y0' => 0, 'x1' => 1, 'type' => 'rect', 'layer' => 'below', }, ], 'height' => 500, 'width' => 500, }
); 

Chart::Plotly::show_plot($plot);
    
