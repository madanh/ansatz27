function testParse(description)

factory = javaMethod('newInstance', 'javax.xml.parsers.DocumentBuilderFactory');
builder = factory.newDocumentBuilder();

file = javaObject('java.io.File', 'testParse.xml');
document = builder.parse(file);

tests = document.getDocumentElement().getElementsByTagName('test');
nl = @(text) strrep(text, sprintf('\n'), '<br/>');

fprintf(1, '# Parsing Examples\n\n');

fprintf(1, '| MATLAB <-|<- Schema <-|<- JSON |\n');
fprintf(1, '|--------|--------|------|\n');

for k=1:tests.getLength()
    test = tests.item(k-1);
    
    getElem = @(tagName) strrep(strtrim(test.getElementsByTagName(tagName).item(0).getTextContent()), repmat(' ', 1, 12), '');

    desc = getElem('description');
    if isempty(desc) || (nargin >= 1 && ~strcmp(desc, description))
        continue;
    end

    code = getElem('matlab');
    schema = getElem('schema');
    json = getElem('json')

    expected = eval(code);

    [actual, errors] = JSON_Parser.parse(json, schema);

    fprintf(1, '| %s |\n', desc);
    fprintf(1, '| %s | %s | %s |\n', nl(code), nl(schema), nl(json));

    if ~isempty(errors)
        keyboard
    end

    if ~isequal(expected, actual)
        expected
        actual
        keyboard
    end

end

fprintf(1, '\n\n');
