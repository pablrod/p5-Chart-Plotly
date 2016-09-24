# NAME

Chart::Plotly - Generate html/javascript charts from perl data using javascript library plotly.js

# SYNOPSIS

    use Chart::Plotly;
    use Browser::Open qw( open_browser );
    use Path::Tiny;
    
    my $html_file = Path::Tiny::tempfile(UNLINK => 0);

    my $data = {x => [1 .. 10],
                mode => 'markers',
                type => 'scatter'
                };
    $data->{'y'} = [map {rand 10 } @{$data->{'x'}} ];
    
    $html_file->spew_utf8(Chart::Dygraphs::render_full_html(data => [$data]));
    open_browser($html_file->canonpath()); 
     

# DESCRIPTION

Generate html/javascript charts from perl data using javascript library plotly.js. The result
is a file that you could see in your favourite browser.

This module does not export anything and the interface is "sub" oriented, but the API is subject to changes.

# FUNCTIONS

## render\_full\_html

### Parameters

- data:

    Data to be represented. The format is the perl version of the data expected by plotly.js: [http://plot.ly/javascript/](http://plot.ly/javascript/)

# AUTHOR

Pablo Rodríguez González

# BUGS

Please report any bugs or feature requests via github: [https://github.com/pablrod/p5-Chart-Dygraphs/issues](https://github.com/pablrod/p5-Chart-Dygraphs/issues)

# LICENSE AND COPYRIGHT

Copyright 2016 Pablo Rodríguez González.

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
