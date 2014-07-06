  test 'chunk with a space in its filename' do
    diff_lines =
    expected =
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'chunk with defaulted now line info' do
    diff_lines =
    expected =
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'two chunks with leading and trailing same lines ' +
    expected =
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'diffs 7 lines apart are not merged ' +
       'into contiguous sections in one chunk' do
      '-aaa',
      '+bbb',
      ' ccc',
      ' ddd',
      ' eee',
      ' ppp',
      ' qqq',
      ' rrr',
      '-sss',
      '+ttt'
      'bbb',
      'ccc',
      'ddd',
      'eee',
      'fff',
      'ppp',
      'qqq',
      'rrr',
      'ttt'
    expected =
      deleted_line('aaa', 1),
      added_line('bbb', 1),
      same_line('ccc', 2),
      same_line('ddd', 3),
      same_line('eee', 4),
      same_line('fff', 5),
      same_line('ppp', 6),
      same_line('qqq', 7),
      same_line('rrr', 8),
      deleted_line('sss', 9),
      added_line('ttt', 9)
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'one chunk with two sections ' +
      ' aaa',
      ' bbb',
      '-ccc',
      '+ddd',
      ' eee',
      '-fff',
      '+ggg',
      ' hhh',
      ' iii',
      ' jjj'
      'aaa',
      'bbb',
      'ddd',
      'eee',
      'ggg',
      'hhh',
      'iii',
      'jjj'
    expected =
      same_line('aaa', 1),
      same_line('bbb', 2),
      deleted_line('ccc', 3),
      added_line('ddd', 3),
      same_line('eee', 4),
      deleted_line('fff', 5),
      added_line('ggg', 5),
      same_line('hhh', 6),
      same_line('iii', 7),
      same_line('jjj', 8)
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'one chunk with one section with only lines added' do
      ' aaa',
      ' bbb',
      ' ccc',
      '+ddd',
      '+eee',
      '+fff',
      ' ggg',
      ' hhh',
      ' iii'
      'aaa',
      'bbb',
      'ccc',
      'ddd',
      'eee',
      'fff',
      'ggg',
      'hhh',
      'iii',
      'jjj'
    expected =
      same_line('aaa', 1),
      same_line('bbb', 2),
      same_line('ccc', 3),
      added_line('ddd', 4),
      added_line('eee', 5),
      added_line('fff', 6),
      same_line('ggg', 7),
      same_line('hhh', 8),
      same_line('iii', 9),
      same_line('jjj', 10)
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'one chunk with one section with only lines deleted' do
    expected =
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'one chunk with one section ' +
      ' ddd',
      ' eee',
      ' fff',
      '-ggg',
      '-hhh',
      '-iii',
      '+jjj',
      ' kkk',
      ' lll',
      ' mmm'
      'bbb',
      'ccc',
      'ddd',
      'eee',
      'fff',
      'jjj',
      'kkk',
      'lll',
      'mmm',
      'nnn'
    expected =
      same_line('bbb', 1),
      same_line('ccc', 2),
      same_line('ddd', 3),
      same_line('eee', 4),
      same_line('fff', 5),
      deleted_line('ggg', 6),
      deleted_line('hhh', 7),
      deleted_line('iii', 8),
      added_line('jjj', 6),
      same_line('kkk', 7),
      same_line('lll', 8),
      same_line('mmm', 9),
      same_line('nnn', 10)
    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'one chunk with one section ' +
    expected =

    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))

    assert_equal expected, actual
  test 'one chunk with one section ' +
    expected =

    diff = GitDiff::GitDiffParser.new(diff_lines).parse_one
    actual = builder.build(diff, source_lines.split("\n"))
    assert_equal expected, actual
  def builder
    GitDiff::GitDiffBuilder.new()