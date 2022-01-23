defmodule Huffman do

    def sample do
        'the quick brown fox jumps over the lazy dog
        this is a sample text that we will use when we build
        up a table we will only handle lower case letters and
        no punctuation symbols the frequency will of course not
        represent english but it is probably not that far off'
    end

    def text()  do
        'this is something that we should encode'
    end

    def test do
        sample = sample()
        tree = tree(sample)
        encode = encode_table(tree)
        decode = decode_table(tree)
        text = text()
        seq = encode(text, encode)
        decode(seq, decode)
    end

    def tree(sample) do
        freq = freq(sample)
        huffman(freq)
    end

    def freq(sample) do freq(sample, [ ]) end
    def freq([ ], freq) do freq end
    def freq([char | rest], freq) do freq(rest, count(char, freq)) end

    def count(char, []) do [{char, 1}] end
    def count(char, [{char, f} | t]) do [{char, f+1}] end
    def count(char, [h|t]) do [h | count(char, t)] end 

    def encode_table(tree) do
        # To implement...
    end

    def decode_table(tree) do
        # To implement...
    end

    def encode(text, table) do
        # To implement...
    end

    def decode(seq, tree) do
        # To implement...
    end

end
